https://docs.docker.com/engine/tutorials/dockervolumes/

https://screencloud.net/v/oi0R

volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql

  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql

  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache

  # User-relative path
  - ~/configs:/etc/configs/:ro

  # Named volume
  - datavolume:/var/lib/mysql
https://docs.docker.com/compose/compose-file/#/volumes-volumedriver