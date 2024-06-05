# sometimes we need to uncompress files as some downstream tools don't work with gz
# we uncompress files per tool to avoid triggering other rules every time this runs
# these are only kept temporarily
rule uncompress:
    input:
        "{genomedir}/{file}.gz",
    output:
        temp("{genomedir}/tmp-{tool}-{file}"),
    log:
       "{genomedir}/logs/uncompress-{tool}-{file}.log",
    shell:
        """
        gunzip -c {input} > {output} 2>> {log}
        """
