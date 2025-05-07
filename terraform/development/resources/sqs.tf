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