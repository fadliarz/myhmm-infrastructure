resource "aws_iam_role" "class-assignment-pipe-iam-role" {
  name = var.class_assignment_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "class-assignment-pipe-iam-policy" {
  name = var.class_assignment_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.class-assignment-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.class-assignment-queue.arn,
          aws_sqs_queue.class-assignment-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "class-assignment-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.class-assignment-pipe-iam-role.name
  policy_arn = aws_iam_policy.class-assignment-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "enrollment-pipe-iam-role" {
  name = var.enrollment_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "enrollment-pipe-iam-policy" {
  name = var.enrollment_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.enrollment-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.enrollment-queue.arn,
          aws_sqs_queue.enrollment-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "enrollment-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.enrollment-pipe-iam-role.name
  policy_arn = aws_iam_policy.enrollment-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "course-pipe-iam-role" {
  name = var.course_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "course-pipe-iam-policy" {
  name = var.course_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.course-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.course-queue.arn,
          aws_sqs_queue.course-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "course-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.course-pipe-iam-role.name
  policy_arn = aws_iam_policy.course-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "lesson-pipe-iam-role" {
  name = var.lesson_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "lesson-pipe-iam-policy" {
  name = var.lesson_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.lesson-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.lesson-queue.arn,
          aws_sqs_queue.lesson-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lesson-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.lesson-pipe-iam-role.name
  policy_arn = aws_iam_policy.lesson-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "class-pipe-iam-role" {
  name = var.class_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "class-pipe-iam-policy" {
  name = var.class_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.class-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.class-queue.arn,
          aws_sqs_queue.class-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "class-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.class-pipe-iam-role.name
  policy_arn = aws_iam_policy.class-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "class-assignment-lambda-iam-role" {
  name = var.class_assignment_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "class-assignment-lambda-iam-policy" {
  name = var.class_assignment_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.class-assignment-queue.arn,
          aws_sqs_queue.class-assignment-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.enrollment-table.arn,
          aws_dynamodb_table.user-assignment-table.arn,
          "${aws_dynamodb_table.enrollment-table.arn}/index/*",
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "class-assignment-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.class-assignment-lambda-iam-role.name
  policy_arn = aws_iam_policy.class-assignment-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "enrollment-lambda-iam-role" {
  name = var.enrollment_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "enrollment-lambda-iam-policy" {
  name = var.enrollment_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.enrollment-queue.arn,
          aws_sqs_queue.enrollment-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.user-assignment-table.arn,
          aws_dynamodb_table.class-assignment-table.arn
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "enrollment-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.enrollment-lambda-iam-role.name
  policy_arn = aws_iam_policy.enrollment-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "course-lambda-iam-role" {
  name = var.course_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "course-lambda-iam-policy" {
  name = var.course_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.course-queue.arn,
          aws_sqs_queue.course-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.lesson-table.arn,
          aws_dynamodb_table.class-table.arn,
          aws_dynamodb_table.category-table.arn
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "course-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.course-lambda-iam-role.name
  policy_arn = aws_iam_policy.course-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "lesson-lambda-iam-role" {
  name = var.lesson_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "lesson-lambda-iam-policy" {
  name = var.lesson_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.lesson-queue.arn,
          aws_sqs_queue.lesson-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.video-table.arn,
          aws_dynamodb_table.attachment-table.arn
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lesson-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.lesson-lambda-iam-role.name
  policy_arn = aws_iam_policy.lesson-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "class-lambda-iam-role" {
  name = var.class_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "class-lambda-iam-policy" {
  name = var.class_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.class-queue.arn,
          aws_sqs_queue.class-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.class-assignment-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "class-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.class-lambda-iam-role.name
  policy_arn = aws_iam_policy.class-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "category-lambda-iam-role" {
  name = var.category_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "category-lambda-iam-policy" {
  name = var.category_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.category-queue.arn,
          aws_sqs_queue.category-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.category-table.arn,
          aws_dynamodb_table.course-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "category-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.category-lambda-iam-role.name
  policy_arn = aws_iam_policy.category-lambda-iam-policy.arn
}


resource "aws_iam_role" "category-pipe-iam-role" {
  name = var.category_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "category-pipe-iam-policy" {
  name = var.category_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.category-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.category-queue.arn,
          aws_sqs_queue.category-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "category-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.category-pipe-iam-role.name
  policy_arn = aws_iam_policy.category-pipe-iam-policy.arn
}


/**


 */


variable "class_assignment_pipe_iam_role_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_PIPE_IAM_ROLE"
}


variable "class_assignment_pipe_iam_policy_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_PIPE_IAM_POLICY"
}


variable "class_assignment_lambda_iam_role_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_LAMBDA_IAM_ROLE"
}


variable "class_assignment_lambda_iam_policy_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_LAMBDA_IAM_POLICY"
}


/**


 */


variable "enrollment_pipe_iam_role_name" {
  type    = string
  default = "ENROLLMENT_PIPE_IAM_ROLE"
}


variable "enrollment_pipe_iam_policy_name" {
  type    = string
  default = "ENROLLMENT_PIPE_IAM_POLICY"
}


variable "enrollment_lambda_iam_role_name" {
  type    = string
  default = "ENROLLMENT_LAMBDA_IAM_ROLE"
}


variable "enrollment_lambda_iam_policy_name" {
  type    = string
  default = "ENROLLMENT_LAMBDA_IAM_POLICY"
}


/**


 */


variable "course_pipe_iam_role_name" {
  type    = string
  default = "COURSE_PIPE_IAM_ROLE"
}


variable "course_pipe_iam_policy_name" {
  type    = string
  default = "COURSE_PIPE_IAM_POLICY"
}


variable "course_lambda_iam_role_name" {
  type    = string
  default = "COURSE_LAMBDA_IAM_ROLE"
}


variable "course_lambda_iam_policy_name" {
  type    = string
  default = "COURSE_LAMBDA_IAM_POLICY"
}


/**


 */


variable "lesson_pipe_iam_role_name" {
  type    = string
  default = "LESSON_PIPE_IAM_ROLE"
}


variable "lesson_pipe_iam_policy_name" {
  type    = string
  default = "LESSON_PIPE_IAM_POLICY"
}


variable "lesson_lambda_iam_role_name" {
  type    = string
  default = "LESSON_LAMBDA_IAM_ROLE"
}


variable "lesson_lambda_iam_policy_name" {
  type    = string
  default = "LESSON_LAMBDA_IAM_POLICY"
}


/**


 */


variable "class_pipe_iam_role_name" {
  type    = string
  default = "CLASS_PIPE_IAM_ROLE"
}


variable "class_pipe_iam_policy_name" {
  type    = string
  default = "CLASS_PIPE_IAM_POLICY"
}


variable "class_lambda_iam_role_name" {
  type    = string
  default = "CLASS_LAMBDA_IAM_ROLE"
}


variable "class_lambda_iam_policy_name" {
  type    = string
  default = "CLASS_LAMBDA_IAM_POLICY"
}


/**


 */


variable "category_pipe_iam_role_name" {
  type    = string
  default = "CATEGORY_PIPE_IAM_ROLE"
}


variable "category_pipe_iam_policy_name" {
  type    = string
  default = "CATEGORY_PIPE_IAM_POLICY"
}


variable "category_lambda_iam_role_name" {
  type    = string
  default = "CATEGORY_LAMBDA_IAM_ROLE"
}


variable "category_lambda_iam_policy_name" {
  type    = string
  default = "CATEGORY_LAMBDA_IAM_POLICY"
}