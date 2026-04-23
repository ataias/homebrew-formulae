class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.10+1ebcc794"
  license "MIT"
  revision 1
  # zls_commit: 1ebcc79429
  # zig_version: 0.17.0-dev.76+ff612334f

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "abe949a4ccb3a029bf8cb0f6a45e416061ecddd7d8266c50ed236718714e6eb4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "2009a2a3499c60de72c7f8742dfdd83d85a8cc8f4145c5cf40e258b59b77323a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "38373616bc18b85e992f2a95395b6c79daa4c86ac7b24178c9ac79c30110ed71"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "bf793aaaae53fe6573dec51965e15bb2360149da9cef9b73641a171f50fd5e11"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end
