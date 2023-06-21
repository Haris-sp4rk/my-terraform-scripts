resource "random_pet" "this" {
  length = 2
}

# Autoscaling Notifications
## SNS - Topic
resource "aws_sns_topic" "myasg_sns_topic" {
  name = "myasg-sns-topic-${random_pet.this.id}"
}

## SNS - Subscription
resource "aws_sns_topic_subscription" "myasg_sns_topic_email_subscription" {
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
  protocol  = "email"
  endpoint  = "harisaaqeel@gmail.com"
}
resource "aws_sns_topic_subscription" "myasg_sns_topic_sms_subscription" {
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
  protocol  = "sms"
  endpoint  = "+923170235214"
}
## Create Autoscaling Notification Resource
resource "aws_autoscaling_notification" "myasg_notifications" {
  group_names = [aws_autoscaling_group.autoscallinggroup.id]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
}
