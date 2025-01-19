# Using 1/4 of PostgreSQL max_connections for the pool size.
# 1/4 is just because it was observed that the `t3a.nano` topped RPS
# when the pool size was 10.
{
  "t3a.nano"     = 10;
  "t3a.micro"    = 15;
  "t3a.medium"   = 30;
  "t3a.xlarge"   = 40;
  "t3a.2xlarge"  = 50;
  "m5a.large"    = 50;
  "m5a.xlarge"   = 60;
  "m5a.2xlarge"  = 95;
  "m5a.4xlarge"  = 120;
  "m5a.8xlarge"  = 150;
  "m5a.12xlarge" = 200;
  "m5a.16xlarge" = 250;
}
