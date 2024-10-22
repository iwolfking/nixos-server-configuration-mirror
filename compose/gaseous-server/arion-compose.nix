{
  project.name = "gaseous-server";
  services.gaseous-server = {
    service.image = "gaseousgames/gaseousserver:latest";
    service.volumes = [ "/mnt/server_data/media/games/gaseous/root:/root/.gaseous-server" ];
    service.ports = [ "5198:80" ];
    service.restart = "unless-stopped";
    service.environment = {
      TZ = "America/Chicago";
      dbhost = "gsdb";
      dbuser = "root";
      dbpass = "gaseous-383udhnn21i2u3i21uj3i23l12hjldhf83h10as9du2";
      igdbclientid = "3evtca3ofmblalpu83h4ytjrjdv7xt";
      igdbclientsecret = "328oulxjtiaz1ul0puharis75ox7hc";
    };
    service.depends_on = ["gsdb"];
  };

  services.gsdb = {
    service = {
      name = "gsdb";
      image = "mysql:8";
      restart = "unless-stopped";
      volumes = [ "/mnt/server_data/media/games/gaseous/db:/var/lib/mysql" ];
      environment = {
        MYSQL_ROOT_PASSWORD = "gaseous-383udhnn21i2u3i21uj3i23l12hjldhf83h10as9du2";
        MYSQL_USER = "gaseous";
        MYSQL_PASSWORD = "gaseous-383udhnn21i2u3i21uj3i23l12hjldhf83h10as9du2";
      };
    };
  };

  networks = {
    default = {
      driver = "bridge";
      ipam = {
        config = [{
          subnet = "10.10.40.0/24";
        }];
      };
    };
  };
}
