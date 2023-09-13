# from pyfcm import FCMNotification

# # Thiết lập thông tin cấu hình cho FCM
# # push_service = FCMNotification(api_key="7MZn8r1bYzOMXaIun13GQpRAO1wFKCTpL7B2xswz")
# push_service = FCMNotification(api_key="AAAAqc6-w4s:APA91bEEMWWkezLSqoHu4doz7MvOIcewSdwDGxFn1fH3Xb5l-mlVxuDsTSqFem8zKGzV8zuJ23Wz-2f--Kffi4A1VBrovPAKm64PZm6cbc7y7XWLu3v4yDktez1FMwGnBFxtElbSZX60")

# # Định nghĩa nội dung thông báo
# message_title = "Thông báo từ Python"
# message_body = "Nội dung thông báo từ Python"
# data_message = {
#     "key1": "value1",
#     "key2": "value2"
# }

# # Gửi thông báo đến chủ đề cụ thể
# # topic_name = "Warning"  # Thay thế bằng tên chủ đề Firebase của bạn
# # result = push_service.notify_topic_subscribers(
# #     topic_name=topic_name,
# #     message_title=message_title,
# #     message_body=message_body,
# #     data_message=data_message
# # )
# fcm.send_to_topic()
# result = fcm.send_to_topic("yourTopic",
#             notification: {body: "This is a FCM Topic Message!"})
# print(result)

from pyfcm import FCMNotification

# Your FCM server key
API_KEY = "AAAAqc6-w4s:APA91bEEMWWkezLSqoHu4doz7MvOIcewSdwDGxFn1fH3Xb5l-mlVxuDsTSqFem8zKGzV8zuJ23Wz-2f--Kffi4A1VBrovPAKm64PZm6cbc7y7XWLu3v4yDktez1FMwGnBFxtElbSZX60"

# Initialize FCMNotification with your API key
push_service = FCMNotification(api_key=API_KEY)

# Send a message to a specific topic
message = {
    "to": "/topics/Warning",
    "notification": {
        "title": "Your Title",
        "body": "Your Message",
    },
}

result = push_service.notify_single_device(data_message=message)

print(result)

