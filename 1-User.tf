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


# "its official" - 

# terraform output -raw admin_user_encrypted_password | base64 --decode | gpg --decrypt -q

# Output the encrypted password "Hell YEAH!!!!!!!"














/*
terraform output -raw admin_user_encrypted_password | base64 --decode > encrypted_password.gpg

gpg --decrypt encrypted_password.gpg

rm encrypted_password.gpg



gpg --list-keys
(I need to be with "Terraform Amin")

1) gpg --delete-secret-keys 8AB4BC444C2B14F252C80543178F5794641C7A39 (This is to delete something)
2) gpg --delete-keys 8AB4BC444C2B14F252C80543178F5794641C7A39


rm pgp/final_clean_key.pub.asc
gpg --export "prolific.homesolution@gmail.com" | base64 > pgp/final_clean_key.b64
terraform plan
*/


