resource "aws_pipes_pipe" "class-assignment-pipe" {
  name     = var.class_assignment_pipe_name
  role_arn = aws_iam_role.class-assignment-pipe-iam-role.arn
  source   = aws_dynamodb_table.class-assignment-table.stream_arn
  target   = aws_sqs_queue.class-assignment-queue.arn
  source_parameters {
    dynamodb_stream_parameters {
      starting_position = "TRIM_HORIZON"
      batch_size        = 1
    }
  }
}


variable "class_assignment_pipe_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_PIPE"
}