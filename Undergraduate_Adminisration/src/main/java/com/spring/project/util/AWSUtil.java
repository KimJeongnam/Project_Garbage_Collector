package com.spring.project.util;

import java.util.ArrayList; 
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.CreateTopicRequest;
import com.amazonaws.services.sns.model.CreateTopicResult;
import com.amazonaws.services.sns.model.MessageAttributeValue;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;
import com.amazonaws.services.sns.model.SubscribeRequest;
import com.amazonaws.services.sns.model.SubscribeResult;

public class AWSUtil {

	private static AmazonSNSClient snsClient = null;	//AWS SNS Client(SMS를 보내기위한 객체)
	private static Map<String, MessageAttributeValue> smsAttributes = null;	//SMS 속성
	private final static String SMS_TYPE = "Promotional";	//SMS Type
	private final static String SMS_SENDER_ID = "1234";		//발신자 번호
	private final static String SMS_COUNTRY_NUM = "+82 ";	//국가 번호
	
	//Init: snsClient, smsAttribute 초기화
	//key, 속성(sendId, smsType)
	public static void init() {
		AWSCredentials credentials = new BasicAWSCredentials("AKIAI2VWA7DQAEHNMDRA", 
				"+4MfJZ/yuPXPUy7tuQCGfoIfDK90SgzjUT1GGnpb");//+4MfJZ/yuPXPUy7tuQCGfoIfDK90SgzjUT1GGnpb
		snsClient = new AmazonSNSClient(credentials);
		smsAttributes = new HashMap<String, MessageAttributeValue>();
		smsAttributes.put("AWS.SNS.SMS.SenderID", new MessageAttributeValue()
				.withStringValue(SMS_SENDER_ID) //The sender ID shown on the device.
				.withDataType("String"));
		smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue()
				.withStringValue(SMS_TYPE) //Sets the type to promotional.
				.withDataType("String"));
	}

	//SMS 전송
	public static void sendSMSMessage( List<String> userCellNumList, String msg) {
		//snsClient가 null 경우 초기화
		if(snsClient == null) {
			init();
		}
		
		//init()메소드에서 할당된 아이디로 토픽(주제) 생성
		String topicArn = createSNSTopic(snsClient);
		
		//토픽의 subscribe추가 (번호 추가)
		//userCellNumList(파싱전 리스트)를 parsedUserCellNum 메소드를 통해 aws sns service에 맞는 형식으로 바꾼다.
		//파싱된 리스트의  값을 포문을 통해 빼낸다.
		for(String userCellNum: parsedUserCellNum(userCellNumList)) {
			
			//해당 토픽(topicArn)에 subscribe 추가(번호추가)
			subscribeToTopic(snsClient, topicArn, "sms", userCellNum);
			
		}
		
		//Topic의 추가된 번호로 SMS 전송
		sendSMSMessageToTopic(snsClient, topicArn, msg, smsAttributes);
		
		//추가했던 토픽 제거
		snsClient.deleteTopic(topicArn);

	}

	//토픽 생성
	public static String createSNSTopic(AmazonSNSClient snsClient) {
		CreateTopicRequest createTopic = new CreateTopicRequest("mySNSTopic");
		CreateTopicResult result = snsClient.createTopic(createTopic);
		System.out.println("Create topic request: " + 
				snsClient.getCachedResponseMetadata(createTopic));
		System.out.println("Create topic result: " + result);
		return result.getTopicArn();
	}

	//해당 토픽(topicArn)에 subscribe 추가(번호추가)
	public static void subscribeToTopic(AmazonSNSClient snsClient, String topicArn, 
			String protocol, String endpoint) { 
		SubscribeRequest subscribe = new SubscribeRequest(topicArn, protocol,
				endpoint);
		SubscribeResult subscribeResult = snsClient.subscribe(subscribe);
		System.out.println("Subscribe request: " + 
				snsClient.getCachedResponseMetadata(subscribe));
		System.out.println("Subscribe result: " + subscribeResult);
	}

	//해당 토픽(topicArn)의 SMS 메시지 전송(실질적인 SMS 전송)
	public static void sendSMSMessageToTopic(AmazonSNSClient snsClient, String topicArn, 
			String message, Map<String, MessageAttributeValue> smsAttributes) {
		PublishResult result = snsClient.publish(new PublishRequest()
				.withTopicArn(topicArn)
				.withMessage(message)
				.withMessageAttributes(smsAttributes));
		System.out.println(result);
	}
	
	//조회된 핸드폰번호를 규격에 맞는 폰 번호로 파싱(ex: 010-1111-1111 -> +82 010 1111 1111)
	//010으로 시작하지 않고, 휴대폰번호가 11자리가 아니면 SMS 전송하지 않도록 함
	//중복 제거
	public static List<String> parsedUserCellNum(List<String> userCellNumList){
		
		//중복제거 - userCellNumList를 매개변수로 넣어 중복제거
		HashSet<String> distinctData = new HashSet<String>(userCellNumList);
		
		//중복 제거된 리스트(distinctData)를 새로운 리스트에 담음
		List<String> distinctUserCellNumList = new ArrayList<String>(distinctData);
		
		//파싱된 데이터를 담을 최종 리스트
		List<String> parsedUserCellNumList = new ArrayList<String>();
		
		//parsing
		for(int i =0; i <distinctUserCellNumList.size(); i++) {
			String chkStr = distinctUserCellNumList.get(i).replaceAll("-", "");
			if(chkStr.startsWith("010") && chkStr.length() ==11) {
				parsedUserCellNumList.add(SMS_COUNTRY_NUM + distinctUserCellNumList.get(i).replaceAll("-", " ")); 
			}
			System.out.println("parsedUserCellNumList" + parsedUserCellNumList);
		}
		return parsedUserCellNumList;
	}
}
