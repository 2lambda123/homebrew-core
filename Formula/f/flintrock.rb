class Flintrock < Formula
  include Language::Python::Virtualenv

  desc "Tool for launching Apache Spark clusters"
  homepage "https://github.com/nchammas/flintrock"
  url "https://files.pythonhosted.org/packages/dc/ad/6e3871a510f0d053aa49caee2140a2f64f2d3fa584d3b70408043295fa57/Flintrock-2.0.0.tar.gz"
  sha256 "ccbbc912823772ea733802ca3f9751c98dacda8c67518683a3dc4ec8b1de38dd"
  license "Apache-2.0"
  revision 7

  bottle do
    rebuild 3
    sha256 cellar: :any,                 arm64_sonoma:   "c62d0778e58f1c65fe2e38c27ac721e4b993d3ae4d6a2aa935765e3149fff19b"
    sha256 cellar: :any,                 arm64_ventura:  "b863dbe1faebd77071133c982f862cc996c01e4709c1401f4834265fa01ab1e1"
    sha256 cellar: :any,                 arm64_monterey: "d84dd921448aa5848934f2abe5ca198e812f8ac6a73a1416c173100bec820842"
    sha256 cellar: :any,                 sonoma:         "335a7374442bcb189f2346edef5d16df56116edcd8a3496ee8117d2a6a6db24f"
    sha256 cellar: :any,                 ventura:        "582bef6c7ec11a033754239dbff5882e49801b77dce67d2621d7e8621a6a1f0e"
    sha256 cellar: :any,                 monterey:       "251bdccda137c921787cd92c8142d2f97888e18b86994b164b26b9dd3a7897bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "63b872a2e2e24f99a80121701edf41992f606969a3a414be80fcb7a2624a9dc5"
  end

  depends_on "rust" => :build # for bcrypt
  depends_on "cffi"
  depends_on "python-cryptography"
  depends_on "python@3.12"
  depends_on "pyyaml"
  depends_on "six"

  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad/bcrypt-4.0.1.tar.gz"
    sha256 "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/d3/61/3b325524005f8d89e5ab62ac71d697ae26f8a546402917b4f759ee707b00/boto3-1.17.90.tar.gz"
    sha256 "bbf727d770a9844834bfbf3f811db1d3438320897f67cfb21cdca5bb8fc23c13"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/d4/a4/ef715db7192535688fae0130714fde5dce91ce2ed8e521aad55a213a5820/botocore-1.20.90.tar.gz"
    sha256 "b301810c4bd6cab1b6eaf6bfd9f25abb27959b586c2e1689bbce035b3fb8ae66"

    # Backport commit to fix ModuleNotFoundError on Python 3.12.
    # Remove in the next formula release.
    patch do
      url "https://github.com/boto/botocore/commit/411f45a014a116bc72462206f3b3b3fc1ac9a630.patch?full_index=1"
      sha256 "4d77944b344b3b35e6c95b73005462b860699349a5c27dee60025f802e80ebb8"
    end
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47/Click-7.0.tar.gz"
    sha256 "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/3c/56/3f325b1eef9791759784aa5046a8f6a1aff8f7c898a2e34506771d3b99d8/jmespath-0.10.0.tar.gz"
    sha256 "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/cf/a1/20d00ce559a692911f11cadb7f94737aca3ede1c51de16e002c7d3a888e0/paramiko-2.7.2.tar.gz"
    sha256 "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
  end

  resource "pynacl" do
    url "https://files.pythonhosted.org/packages/a7/22/27582568be639dfe22ddb3902225f91f2f17ceff88ce80e4db396c8986da/PyNaCl-1.5.0.tar.gz"
    sha256 "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/27/90/f467e516a845cf378d85f0a51913c642e31e2570eb64b352c4dc4c6cbfc7/s3transfer-0.4.2.tar.gz"
    sha256 "cb022f4b16551edebbb31a377d3f09600dbada7363d8c5db7976e7f47732e1b2"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e2/7d/539e6f0cf9f0b95b71dd701a56dae89f768cd39fd8ce0096af3546aeb5a3/urllib3-1.26.16.tar.gz"
    sha256 "8f135f6502756bde6b2a9b28989df5fbe87c9970cecaa69041edcce7f0589b14"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    ENV["LC_ALL"] = "en_US.UTF-8"
    system bin/"flintrock"
    msg = shell_output("#{bin}/flintrock destroy fascism 2>&1", 1)
    assert_match "could not find your AWS credentials", msg
  end
end
