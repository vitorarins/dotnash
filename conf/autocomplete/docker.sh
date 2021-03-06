# docker auto complete

# The `parts` argument hold the line splited by space.
fn docker_complete(parts, line, pos) {
	var ret = ()

	var partsz <= len($parts)
	var choice <= (
		echo "attach build commit cp create diff events exec export history images import info inspect kill load login logout logs network node pause port ps pull push rename restart rm rmi run save search service start stats stop swarm tag top unpause update version volume wait" |
		tr " " "\n" |
		-fzf --header "Docker subcommands: "
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
