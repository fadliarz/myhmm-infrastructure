resource "aws_sqs_queue" "class-assignment-queue" {
  name = var.class_assignment_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.class-assignment-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "class-assignment-dlq" {
  name = var.class_assignment_dlq_name
}

/**


 */


resource "aws_sqs_queue" "enrollment-queue" {
  name = var.enrollment_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.enrollment-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "enrollment-dlq" {
  name = var.enrollment_dlq_name
}


/**


 */


variable "class_assignment_queue_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_QUEUE"
}


variable "class_assignment_dlq_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_DLQ"
}


variable "enrollment_queue_name" {
  type    = string
  default = "ENROLLMENT_QUEUE"
}


variable "enrollment_dlq_name" {
  type    = string
  default = "ENROLLMENT_DLQ"
}