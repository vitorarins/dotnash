# auto complete for ~/.ssh/config

# The `parts` argument hold the line splited by space.
fn ssh_complete(parts, line, pos) {
	var ret = ()

	var choices <= awk "$1 == \"Host\" { host = $2; printf \"%s \", host; }" $HOME+"/.ssh/config"
	var choice, status <= (
		echo $choices |
		tr " " "\n" |
		-fzf --header "SSH hosts: "
					--reverse
					 |
		tr -d "\n"
	)

	if $status != "0" {
		return $ret
	}

	ret = ($choice+" " "0")

	return $ret
}
