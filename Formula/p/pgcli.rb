class Pgcli < Formula
  include Language::Python::Virtualenv

  desc "CLI for Postgres with auto-completion and syntax highlighting"
  homepage "https://pgcli.com/"
  url "https://files.pythonhosted.org/packages/08/a7/448bcaf13dbcb4bd00c4f62fea1b2b491958653646da41c785755df6235f/pgcli-4.0.1.tar.gz"
  sha256 "f2feea2099ce1ad5e8a9d5d93b0edaf60dc61e97b21b75e91d9723939ce53bd2"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "86e4def3477b49f091c9e8c15381b8c17699a9025e6c063246b3169ebc492e0e"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "3b23918cc18f198c081626dd6ad5911d53402742ca3fd3d981fbb018be40b926"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c8e3e1ef0b5e3e0cbaf4909fd50175996a62342ee8731797db1024b405d6157d"
    sha256 cellar: :any_skip_relocation, sonoma:         "bb15b6e12f03fdbbbb21a5f9a635f210fcaf0b103d1490f64d284032f1d733e9"
    sha256 cellar: :any_skip_relocation, ventura:        "bd85d8fe5134674de16e513be86efaa1f44a9610d29e99bc1548c6673ca1e3d6"
    sha256 cellar: :any_skip_relocation, monterey:       "3d125e807afe293b5d71297598d41e093f556b7808df2f78955594ba809bf1d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "aa1dddde994f75c2f4d75a0e06ed591798bb7afa1064a573bf23922b2f0171f0"
  end

  depends_on "python-setuptools" => :build # for pendulum
  depends_on "libpq"
  depends_on "pygments"
  depends_on "python-click"
  depends_on "python-tabulate"
  depends_on "python-typing-extensions"
  depends_on "python@3.12"
  depends_on "six"

  resource "cli-helpers" do
    url "https://files.pythonhosted.org/packages/27/01/6aaa4fc415274ac77372b4d259c234b9f5bfc8d78144c3fda1f3019d4690/cli_helpers-2.3.0.tar.gz"
    sha256 "e7174d003a2b58fd3e31a73fbbc45d5aa513de62cbd42d437f78b9658bd5f967"
  end

  resource "configobj" do
    url "https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb/configobj-5.0.8.tar.gz"
    sha256 "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97"
  end

  resource "pendulum" do
    url "https://files.pythonhosted.org/packages/db/15/6e89ae7cde7907118769ed3d2481566d05b5fd362724025198bb95faf599/pendulum-2.1.2.tar.gz"
    sha256 "b06a0ca1bfe41c990bbf0c029f0b6501a7f2ec4e38bfec730712015e8860f207"
  end

  resource "pgspecial" do
    url "https://files.pythonhosted.org/packages/2e/b8/52f0d19d80872df8ed2bbfc4569196e30d455d3b5f91659a6bf5c0d8e57e/pgspecial-2.1.1.tar.gz"
    sha256 "a38239cd961fac33ce6da35c466d758acb6f942901598d7df74e5b82fe6f5636"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/9a/02/76cadde6135986dc1e82e2928f35ebeb5a1af805e2527fe466285593a2ba/prompt_toolkit-3.0.39.tar.gz"
    sha256 "04505ade687dc26dc4284b1ad19a83be2f2afe83e7a828ace0c72f3a1df72aac"
  end

  resource "psycopg" do
    url "https://files.pythonhosted.org/packages/42/30/73ebc6d40269fa4fdc090c374d1dd30df822e885a742719b0fe952c9d86c/psycopg-3.1.12.tar.gz"
    sha256 "cec7ad2bc6a8510e56c45746c631cf9394148bdc8a9a11fd8cf8554ce129ae78"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "pytzdata" do
    url "https://files.pythonhosted.org/packages/67/62/4c25435a7c2f9c7aef6800862d6c227fc4cd81e9f0beebc5549a49c8ed53/pytzdata-2020.1.tar.gz"
    sha256 "3efa13b335a00a8de1d345ae41ec78dd11c9f8807f522d39850f2dd828681540"
  end

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/ff/e1/b16b16a1aa12174349d15b73fd4b87e641a8ae3fb1163e80938dbbf6ae98/setproctitle-1.3.3.tar.gz"
    sha256 "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
  end

  resource "sqlparse" do
    url "https://files.pythonhosted.org/packages/65/16/10f170ec641ed852611b6c9441b23d10b5702ab5288371feab3d36de2574/sqlparse-0.4.4.tar.gz"
    sha256 "d446183e84b8349fa3061f0fe7f06ca94ba65b426946ffebe6e3e8295332420c"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/a6/ad/428bc4ff924e66365c96994873e09a17bb5e8a1228be6e8d185bc2a11de9/wcwidth-0.2.9.tar.gz"
    sha256 "a675d1a4a2d24ef67096a04b85b02deeecd8e226f57b5e3a72dbb9ed99d27da8"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")

    # Help `psycopg` find our `libpq`, which is keg-only so its attempt to use `pg_config --libdir` fails
    resource("psycopg").stage do
      inreplace "psycopg/pq/_pq_ctypes.py", "libname = find_libpq_full_path()",
                                            "libname = '#{Formula["libpq"].opt_lib/shared_library("libpq")}'"
      venv.pip_install Pathname.pwd
    end

    # add setuptools dependency to pendulum
    # upstream PR ref, https://github.com/sdispater/pendulum/pull/765
    resource("pendulum").stage do
      inreplace "pyproject.toml", "\"poetry-core>=1.0.0a9\"",
                                  "\"poetry-core>=1.0.0a9\", \"setuptools>=67.2.0; python_version>='3.12'\""
      venv.pip_install Pathname.pwd
    end

    # Switch build-system to poetry-core to avoid rust dependency on Linux.
    # Remove when merged/released: https://github.com/sdispater/pytzdata/pull/13
    resource("pytzdata").stage do
      inreplace "pyproject.toml", 'requires = ["poetry>=1.0.0"]', 'requires = ["poetry-core>=1.0"]'
      inreplace "pyproject.toml", 'build-backend = "poetry.masonry.api"', 'build-backend = "poetry.core.masonry.api"'
      venv.pip_install_and_link Pathname.pwd
    end

    res = resources.to_set(&:name) - ["psycopg", "pendulum", "pytzdata"]
    venv.pip_install res
    venv.pip_install_and_link buildpath

    generate_completions_from_executable(bin/"pgcli", shells: [:fish, :zsh], shell_parameter_format: :click)
  end

  test do
    assert_match "Invalid DSNs found in the config file", shell_output("#{bin}/pgcli --list-dsn 2>&1", 1)
    (testpath/"pgclirc").write <<~EOS
      [alias_dsn]
      homebrew_dsn = postgresql://homebrew:password@localhost/dbname
    EOS
    assert_match "homebrew_dsn", shell_output("#{bin}/pgcli --pgclirc=#{testpath}/pgclirc --list-dsn")
  end
end
