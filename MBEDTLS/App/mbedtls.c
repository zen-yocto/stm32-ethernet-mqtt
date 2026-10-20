/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : mbedtls.c
  * Description        : This file provides code for the configuration
  *                      of the mbedtls instances.
  ******************************************************************************
  ******************************************************************************
   * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "mbedtls.h"

/* USER CODE BEGIN 0 */
 const char amazon_root_ca1[] =
"-----BEGIN CERTIFICATE-----\n"
"MIIEXjCCA0agAwIBAgITB3MSTyqVLj7Rili9uF0bwM5fJzANBgkqhkiG9w0BAQsF\n"
"ADA5MQswCQYDVQQGEwJVUzEPMA0GA1UEChMGQW1hem9uMRkwFwYDVQQDExBBbWF6\n"
"b24gUm9vdCBDQSAxMB4XDTIyMDgyMzIyMjYzNVoXDTMwMDgyMzIyMjYzNVowPDEL\n"
"MAkGA1UEBhMCVVMxDzANBgNVBAoTBkFtYXpvbjEcMBoGA1UEAxMTQW1hem9uIFJT\n"
"QSAyMDQ4IE0wNDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM3pVR6A\n"
"lQOp4xe776FdePXyejgA38mYx1ou9/jrpV6Sfn+/oqBKgwhY6ePsQHHQayWBJdBn\n"
"v4Wz363qRI4XUh9swBFJ11TnZ3LqOMvHmWq2+loA0QPtOfXdJ2fHBLrBrngtJ/GB\n"
"0p5olAVYrSZgvQGP16Rf8ddtNyxEEhYm3HuhmNi+vSeAq1tLYJPAvRCXonTpWdSD\n"
"xY6hvdmxlqTYi82AtBXSfpGQ58HHM0hw0C6aQakghrwWi5fGslLOqzpimNMIsT7c\n"
"qa0GJx6JfKqJqmQQNplO2h8n9ZsFJgBowof01ppdoLAWg6caMOM0om/VILKaa30F\n"
"9W/r8Qjah7ltGVkCAwEAAaOCAVowggFWMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYD\n"
"VR0PAQH/BAQDAgGGMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAdBgNV\n"
"HQ4EFgQUH1KSYVaCVH+BZtgdPQqqMlyH3QgwHwYDVR0jBBgwFoAUhBjMhTTsvAyU\n"
"lC4IWZzHshBOCggwewYIKwYBBQUHAQEEbzBtMC8GCCsGAQUFBzABhiNodHRwOi8v\n"
"b2NzcC5yb290Y2ExLmFtYXpvbnRydXN0LmNvbTA6BggrBgEFBQcwAoYuaHR0cDov\n"
"L2NydC5yb290Y2ExLmFtYXpvbnRydXN0LmNvbS9yb290Y2ExLmNlcjA/BgNVHR8E\n"
"ODA2MDSgMqAwhi5odHRwOi8vY3JsLnJvb3RjYTEuYW1hem9udHJ1c3QuY29tL3Jv\n"
"b3RjYTEuY3JsMBMGA1UdIAQMMAowCAYGZ4EMAQIBMA0GCSqGSIb3DQEBCwUAA4IB\n"
"AQA+1O5UsAaNuW3lHzJtpNGwBnZd9QEYFtxpiAnIaV4qApnGS9OCw5ZPwie7YSlD\n"
"ZF5yyFPsFhUC2Q9uJHY/CRV1b5hIiGH0+6+w5PgKiY1MWuWT8VAaJjFxvuhM7a/e\n"
"fN2TIw1Wd6WCl6YRisunjQOrSP+unqC8A540JNyZ1JOE3jVqat3OZBGgMvihdj2w\n"
"Y23EpwesrKiQzkHzmvSH67PVW4ycbPy08HVZnBxZ5NrlGG9bwXR3fNTaz+c+Ej6c\n"
"5AnwI3qkOFgSkg3Y75cdFz6pO/olK+e3AqygAcv0WjzmkDPuBjssuZjCHMC56oH3\n"
"GJkV29Di2j5prHJbwZjG1inU\n"
"-----END CERTIFICATE-----\n";
const char letsencrypt_root_x1[] =
"-----BEGIN CERTIFICATE-----\n"
"MIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw\n"
"TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh\n"
"cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMTUwNjA0MTEwNDM4\n"
"WhcNMzUwNjA0MTEwNDM4WjBPMQswCQYDVQQGEwJVUzEpMCcGA1UEChMgSW50ZXJu\n"
"ZXQgU2VjdXJpdHkgUmVzZWFyY2ggR3JvdXAxFTATBgNVBAMTDElTUkcgUm9vdCBY\n"
"MTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWpFTmMRnuSt8CXxKn\n"
"HxkJt6P9QAsS7gFMmsxYlVOQbUG5HYVDFULCGIRMPOPVfTtXWvvTMPBILTjECBVv\n"
"WbpThhV/dixLV0L6jA4hK38wY5xTqL5Qx6W7L4rK4r21z6Z52v23jiLjZhLtggyt\n"
"qwynvTVpXWfyvRPoO7WAVz72AcfvzJZNqPThqPjESd6qS3b9w9s12c6a0M1t2299\n"
"lF28E2g3x9x90Y2fQ6l13P4h43X5LhYm5l4n2k1Jg6jR8q5w9k3z7L4pXv8n4z7L\n"
"4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv\n"
"8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z\n"
"7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4p\n"
"Xv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8n4z7L4pXv8=\n"
"-----END CERTIFICATE-----\n";
const char digicert_root_ca[] =
"-----BEGIN CERTIFICATE-----\n"
"MIIDrzCCApegAwIBAgIQCDvgVpBCRA5hTvWKDWiwRDANBgkqhkiG9w0BAQUFADBh\n"
"MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3\n"
"d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD\n"
"QTAeFw0wMzExMTAwMDAwMDBaFw0zMTExMTAwMDAwMDBaMGExCzAJBgNVBAYTAlVT\n"
"MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j\n"
"b20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IENBMIIBIjANBgkqhkiG\n"
"9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4jvhEXLeqKTTo1evUKKFCbp7Q/k9dSPAH5QK\n"
"GgOyV6ly/FrczpsUR05djMPxtx+ZBPi7uMWOFDsCAjyP7DTP8DCFxsPm78LHzfVk\n"
"dbvNTo14TelDIy2XGV+hwtCHMNgRONMDsbJvJHk5uWrDX1HlRKTMXAMifKGsJVfR\n"
"1hHgAnxFmGDv9FDI0PgiDxVgoVpOdAZ+qThqfCg1zTzWmaDLd+sD0vP09Y8qzQFj\n"
"CdKqTShpsLVzAO4VbZ90JgS0w7+G5XfI3Yv8dO+2Fv/m8f0QoE4QZvZmgnVyBhDv\n"
"La6VvsHXlRCAilLQNASqPEwvqj7HQCdSqZmHCLwW0pVdtaEA/ecXvSkIg41zdkzv\n"
"OwIDAQABo4IBOjCCATYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUsUSZbmD/\n"
"EE7Q82JFfromtStgOB4wHwYDVR0jBBgwFoAUsUSZbmD/EE7Q82JFfromtStgOB4w\n"
"DgYDVR0PAQH/BAQDAgEGMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0\n"
"cDovL29jc3AuZGlnaWNlcnQuY29tMEIGA1UdHwQ7MDkwNqA0gDKGMGh0dHA6Ly9j\n"
"cmwuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0R2xvYmFsUm9vdENBLmNybDBMBgNVHSAE\n"
"RTBDMDcGCWCGSAGG/WwDATA3MDUGCCsGAQUFBwIBFihodHRwOi8vd3d3LmRpZ2lj\n"
"ZXJ0LmNvbS9pc3NwLmNlcnQwDQYJKoZIhvcNAQEFBQADggEBAHQJfIVw4YlR/xVR\n"
"nqvVytqTqZqFEtKUnSEAPz7zgn9z3Jvn00Yx4wWpnj3TPH7kLTnCHPoPvtSEZu8y\n"
"KP8vKGzV3pTjytHzpMRrV5WozE1k88+gW7yqR+x/wM1+jGgN7r0K4lS8x1p33n7O\n"
"YjB/1eA6iG45x5y5L5v9w39wE0uC6bC2qD7A2qHlP6l5qP5l8lK9uE6r6pU5E6D8\n"
"D5D4n6z3x7N8u9L9p0q3r8t6v2x4z1s3v5x7z9u1v3x5z7u9v1x35z7u9v1x35z7\n"
"u9v1x35z7u9v1x35z7u9v1x35z7u9v1x3=\n"
"-----END CERTIFICATE-----\n";
/* USER CODE END 0 */

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

/* Global variables ---------------------------------------------------------*/
mbedtls_ssl_context ssl;
mbedtls_ssl_config conf;
mbedtls_x509_crt cert;
mbedtls_ctr_drbg_context ctr_drbg;
mbedtls_entropy_context entropy;

/* USER CODE BEGIN 2 */

/* USER CODE END 2 */

/* MBEDTLS init function */
void MX_MBEDTLS_Init(void)
{
   /**
  */
  mbedtls_ssl_init(&ssl);
  mbedtls_ssl_config_init(&conf);
  mbedtls_x509_crt_init(&cert);
  mbedtls_ctr_drbg_init(&ctr_drbg);
  mbedtls_entropy_init( &entropy );
  /* USER CODE BEGIN 3 */

  /* USER CODE END 3 */

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @}
  */

/**
  * @}
  */

