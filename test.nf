

input_ch = Channel.fromPath(params.in_pat) 


process split_by_chrom {

   input:
      file(bam) from input_ch

   output:
      set val(name), file("${name}*.bam") into splitbams_ch

   script:
      name = bam.baseName.replaceFirst(".bam","")
     """
         bamtools split -in ${bam} -reference 
     """

}

splitbams_ch.subscribe {println "$it"}
