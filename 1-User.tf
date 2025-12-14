resource "aws_iam_user" "admin_user" {
  name          = "user_admin1"
  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "admin_attach" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_user_login_profile" "admin_login" {
  user                    = aws_iam_user.admin_user.name
  /* password_length         = 20 */
  password_reset_required = true
  pgp_key                 = file("pgp/final_clean_key.b64")
}


data "aws_caller_identity" "current" {}


/*

rm pgp/final_clean_key.pub.asc
gpg --export "prolific.homesolution@gmail.com" | base64 > pgp/final_clean_key.b64
terraform plan
*/


