function repeat -d 'Repeat a command N times' -a n cmd
	for i in (seq $n);
		echo "==> $i/$n <=="
		command $cmd
	end
end
