def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server."
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
    run "#{sudo} apt-get -y install imagemagick"
    run "#{sudo} apt-get -y install libxml2 libxslt-dev libxml2-dev libautotrace-dev libfreetype6-dev"  # Cause an error with nokoi girl
    # I still need to install ffmpeg and dependancies!
  end
end
