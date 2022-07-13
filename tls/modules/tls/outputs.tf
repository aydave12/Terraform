#-----------------------------------------------------------
# tls_private_key
#-----------------------------------------------------------
output "tls_private_key_algorithm" {
  description = "The algorithm that was selected for the key."
  value       = element(concat(tls_private_key.private_key.*.algorithm, [""]), 0)
}

output "tls_private_key_private_key_pem" {
  description = "The private key data in PEM format."
  value       = element(concat(tls_private_key.private_key.*.private_key_pem, [""]), 0)
}

output "tls_private_key_public_key_pem" {
  description = "The public key data in PEM format."
  value       = element(concat(tls_private_key.private_key.*.public_key_pem, [""]), 0)
}

output "tls_private_key_public_key_openssh" {
  description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves 'P256', 'P384' and 'P521' are supported. This attribute is empty if an incompatible ECDSA curve is selected."
  value       = element(concat(tls_private_key.private_key.*.public_key_openssh, [""]), 0)
}

output "tls_private_key_public_key_fingerprint_md5" {
  description = "The md5 hash of the public key data in OpenSSH MD5 hash format, e.g. aa:bb:cc:.... Only available if the selected private key format is compatible, as per the rules for public_key_openssh."
  value       = element(concat(tls_private_key.private_key.*.public_key_fingerprint_md5, [""]), 0)
}

#-----------------------------------------------------------
# tls_self_signed_cert
#-----------------------------------------------------------
output "tls_self_signed_cert_cert_pem" {
  description = "The certificate data in PEM format."
  value       = element(concat(tls_self_signed_cert.self_signed_cert.*.cert_pem, [""]), 0)
}

output "tls_self_signed_cert_validity_start_time" {
  description = "The time after which the certificate is valid, as an RFC3339 timestamp."
  value       = element(concat(tls_self_signed_cert.self_signed_cert.*.validity_start_time, [""]), 0)
}

output "tls_self_signed_cert_validity_end_time" {
  description = "The time until which the certificate is invalid, as an RFC3339 timestamp."
  value       = element(concat(tls_self_signed_cert.self_signed_cert.*.validity_end_time, [""]), 0)
}

#-----------------------------------------------------------
# tls_locally_signed_cert
#-----------------------------------------------------------
output "tls_locally_signed_cert_cert_pem" {
  description = "The certificate data in PEM format."
  value       = element(concat(tls_locally_signed_cert.locally_signed_cert.*.cert_pem, [""]), 0)
}

output "tls_locally_signed_cert_validity_start_time" {
  description = "The time after which the certificate is valid, as an RFC3339 timestamp."
  value       = element(concat(tls_locally_signed_cert.locally_signed_cert.*.validity_start_time, [""]), 0)
}

output "tls_locally_signed_cert_validity_end_time" {
  description = "The time until which the certificate is invalid, as an RFC3339 timestamp."
  value       = element(concat(tls_locally_signed_cert.locally_signed_cert.*.validity_end_time, [""]), 0)
}

#-----------------------------------------------------------
# tls_cert_request
#-----------------------------------------------------------
output "tls_cert_request_cert_request_pem" {
  description = "The certificate request data in PEM format."
  value       = element(concat(tls_cert_request.cert_request.*.cert_request_pem, [""]), 0)
}
