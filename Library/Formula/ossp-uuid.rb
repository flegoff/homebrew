require 'formula'

class OsspUuid < Formula
  url 'ftp://ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz'
  mirror 'http://www.mirrorservice.org/sites/ftp.ossp.org/pkg/lib/uuid/uuid-1.6.2.tar.gz'
  homepage 'http://www.ossp.org/pkg/lib/uuid/'
  md5 '5db0d43a9022a6ebbbc25337ae28942f'

  def install
    ENV.append 'CFLAGS', '-arch i386' if ARGV.include? '--32-bit'
    ENV.append 'LDFLAGS', '-arch i386' if ARGV.include? '--32-bit'
    system "./configure", "--disable-debug",
                          "--without-perl",
                          "--without-php",
                          "--without-pgsql",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
