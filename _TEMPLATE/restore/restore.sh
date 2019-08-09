echo "Droping database drupal: enter mysql password"
echo "drop database if exists drupal; create database drupal; drop database if exists simplesaml; create database simplesaml;" | mysql -u root -pbob -h db
echo "Restoring database backup: enter mysql password"
for f in *.sql.gz; do
    n=$(echo $f | tr _ /)
    zcat $f | mysql -u root -pbob -h db drupal
done
