
{ self, config, ... }:
{
    imports = [
      (import ./compose/nextcloud)
      (import ./compose/onlyoffice)
    ];
}