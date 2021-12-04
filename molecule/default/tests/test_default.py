import os
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


def test_git_config(host):
    """Check the system wide git config
    sdg
    dfg
    """
    cmd = host.run("git --no-pager  config --list | grep user\.")

    assert "user.name=Nate Marks" in cmd.stdout
    assert "user.email=npmarks@gmail.com" in cmd.stdout
