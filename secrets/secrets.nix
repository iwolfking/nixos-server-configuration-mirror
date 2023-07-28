let 
  iwolfking = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAekDwmCZjODeZAfARCw4azOXfvh1aa/zZGhLcRIurRh";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFNxEcaW3ZogDYcsOotwkRMGkQhnx9/GXxTvTlmUIVG";
  users = [iwolfking];
in
{
  "gluetun/environment.env.age".publicKeys = [iwolfking system];
  "autoheal/environment.env.age".publicKeys = [iwolfking system];
  "nextcloud/environment.env.age".publicKeys = [iwolfking system];
  "paperless/environment.env.age".publicKeys = [iwolfking system];
  "keycloak/environment.env.age".publicKeys = [iwolfking system];
  "caddy/environment.env.age".publicKeys = [iwolfking system];
}