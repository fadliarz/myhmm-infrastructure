resource "aws_sqs_queue" "course-queue" {
  name = var.course_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.course-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "course-dlq" {
  name = var.course_dlq_name
}


/**


 */


resource "aws_sqs_queue" "lesson-queue" {
  name = var.lesson_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.lesson-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "lesson-dlq" {
  name = var.lesson_dlq_name
}


/**


 */


resource "aws_sqs_queue" "class-queue" {
  name = var.class_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.class-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "class-dlq" {
  name = var.class_dlq_name
}


/**


 */


resource "aws_sqs_queue" "category-queue" {
  name = var.category_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.category-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "category-dlq" {
  name = var.category_dlq_name
}


/**


 */


resource "aws_sqs_queue" "enrollment-and-class-assignment-queue" {
  name                        = var.enrollment_and_class_assignment_queue_name
  fifo_queue                  = true
  content_based_deduplication = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.enrollment-and-class-assignment-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "enrollment-and-class-assignment-dlq" {
  name       = var.enrollment_and_class_assignment_dlq_name
  fifo_queue = true
}


/**


 */


resource "aws_sqs_queue" "tag-queue" {
  name = var.tag_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.tag-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "tag-dlq" {
  name = var.tag_dlq_name
}


/**


 */


resource "aws_sqs_queue" "scholarship-queue" {
  name = var.scholarship_queue_name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.scholarship-dlq.arn
    maxReceiveCount     = 5
  })
}


resource "aws_sqs_queue" "scholarship-dlq" {
  name = var.scholarship_dlq_name
}


/**


 */



variable "course_queue_name" {
  type    = string
  default = "COURSE_QUEUE"
}


variable "course_dlq_name" {
  type    = string
  default = "COURSE_DLQ"
}


variable "lesson_queue_name" {
  type    = string
  default = "LESSON_QUEUE"
}


variable "lesson_dlq_name" {
  type    = string
  default = "LESSON_DLQ"
}


variable "class_queue_name" {
  type    = string
  default = "CLASS_QUEUE"
}


variable "class_dlq_name" {
  type    = string
  default = "CLASS_DLQ"
}

variable "category_queue_name" {
  type    = string
  default = "CATEGORY_QUEUE"
}


variable "category_dlq_name" {
  type    = string
  default = "CATEGORY_DLQ"
}


variable "enrollment_and_class_assignment_queue_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_QUEUE.fifo"
}


variable "enrollment_and_class_assignment_dlq_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_DLQ.fifo"
}


variable "tag_queue_name" {
  type    = string
  default = "TAG_QUEUE"
}


variable "tag_dlq_name" {
  type    = string
  default = "TAG_DLQ"
}


variable "scholarship_queue_name" {
  type    = string
  default = "SCHOLARSHIP_QUEUE"
}


variable "scholarship_dlq_name" {
  type    = string
  default = "SCHOLARSHIP_DLQ"
}

