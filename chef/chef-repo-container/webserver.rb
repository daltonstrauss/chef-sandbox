# Update apt cache first
apt_update 'Update apt cache daily' do
    frequency 86_400
    action :periodic
end

# Install apache2
package 'apache2'

service 'apache2' do
  supports status: true
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content '<html>
    <body>
      <h1> Hello World</h1>
    </body>
  </html>'
end
