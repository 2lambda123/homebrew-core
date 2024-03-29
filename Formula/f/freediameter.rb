class Freediameter < Formula
  desc "Open source Diameter (Authentication) protocol implementation"
  homepage "http://www.freediameter.net"
  license "BSD-3-Clause"

  # TODO: Switch to `libidn2` on next release and remove stable & head blocks
  stable do
    url "http://www.freediameter.net/hg/freeDiameter/archive/1.5.0.tar.gz"
    sha256 "2500f75b70d428ea75dd25eedcdddf8fb6a8ea809b02c82bf5e35fe206cbbcbc"
    depends_on "libidn"
  end

  livecheck do
    url "http://www.freediameter.net/hg/freeDiameter/json-tags"
    regex(/["']tag["']:\s*?["']v?(\d+(?:\.\d+)+)["']/i)
  end

  bottle do
    sha256                               arm64_sonoma:   "5e7e309a74ed83b7c3fc9a428eaafc73a98addcdce57086427e01ba482ad4d4a"
    sha256 cellar: :any,                 arm64_ventura:  "d692eec62f99ce01bafd11d1e6931fe4dd6e439a88768edda86cc7a6957a4bf0"
    sha256 cellar: :any,                 arm64_monterey: "ef01b2ee94b8f7b8794b6880188ec09d7a8458b0e10a2b6063b4dcc0f9b7c798"
    sha256 cellar: :any,                 arm64_big_sur:  "a2fd2271af79fd86ec7162e0af3adbaf611f280563a84dc2a98af96b7b3a3a4d"
    sha256                               sonoma:         "a228fb80c2fd62f9decd0588b3f02ba544f48e456c2d8797e1aeae8b563fc032"
    sha256 cellar: :any,                 ventura:        "4ab626305bfe4f0a658d1afee146c2b9424bd09f0003f274a34915602e8d2271"
    sha256 cellar: :any,                 monterey:       "506a0a7375314a874e8a04b4904d0fe9d7c83bda4c494171c4ceee242debd81d"
    sha256 cellar: :any,                 big_sur:        "2c99cc840e0daebf52793d55e91ec616416c7fc7c4f4a8c332c6fe8c52fd181d"
    sha256 cellar: :any,                 catalina:       "92933b4a5076f85098b784f47f3943065444b9dda243c6165d38aaffb9122b68"
    sha256 cellar: :any,                 mojave:         "3d5aa2577193d90113f4deadd81c6db0b40384a4cf3cca096e6edeb76ee734e3"
    sha256 cellar: :any,                 high_sierra:    "a242566b7096b737a094ebe7c792fe306ab6f06f28cded3b5c6660962b812610"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f1be75ed61dff3fcd06cd4c3516843ab0c516e59009d7767b7a38ded9a09431e"
  end

  head do
    url "https://github.com/freeDiameter/freeDiameter.git", branch: "master"
    depends_on "libidn2"
  end

  depends_on "cmake" => :build
  depends_on "gnutls"
  depends_on "libgcrypt"

  uses_from_macos "bison" => :build
  uses_from_macos "flex" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
                    "-DDEFAULT_CONF_PATH=#{etc}",
                    "-DDISABLE_SCTP=ON",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    doc.install Dir["doc/*"]
    pkgshare.install "contrib"
  end

  def post_install
    return if File.exist?(etc/"freeDiameter.conf")

    cp doc/"freediameter.conf.sample", etc/"freeDiameter.conf"
  end

  def caveats
    <<~EOS
      To configure freeDiameter, edit #{etc}/freeDiameter.conf to taste.

      Sample configuration files can be found in #{doc}.

      For more information about freeDiameter configuration options, read:
        http://www.freediameter.net/trac/wiki/Configuration

      Other potentially useful files can be found in #{opt_pkgshare}/contrib.
    EOS
  end

  service do
    run opt_bin/"freeDiameterd"
    keep_alive true
    require_root true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/freeDiameterd --version")
  end
end
