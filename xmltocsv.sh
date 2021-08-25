#!/bin/sh

        echo "Start Process:"
        echo "==========================================================================================="
        echo -ne "  Enter the XML file path: "
        read xmlpath
        echo -ne "  Enter the CSV file path:"
        read csvpath
        if [ ! -d $xmlpath ]
        then
                echo "XML file directory is not found. please provide proper directory path"
                 exit 0
        fi
        if [ ! -d $csvpath ]
        then
                echo "CSV file directory is not found. please provide proper directory path"
                exit 0
        fi


        ext='.csv'
        xmlcnt=0
        csvcnt=0
        while true
        do

                xmlfilename=` ls -l $xmlpath | head -2 | tail -1  | cut -d " " -f9 `

                echo $xmlfilename | grep ".xml" >/dev/null
                if [ $? -eq 0 ]
                then
                        xmlcnt=` expr $xmlcnt + 1 `
                        csvcnt=` expr $csvcnt + 1 `
                        filename=` echo $xmlfilename | awk -F ".xml" '{print $1}'| tr -d '\r\n' `
                        csvfile=$filename$ext
                        xsltproc xslfile.xsl $xmlpath/$xmlfilename >> $csvpath/$csvfile
                       # rm -f $xmlpath/$xmlfilename
                else
                        xmlflcnt=` ls -l $xmlpath | wc -l `
                        if [ $xmlflcnt -eq 1 ]
                        then
                                break
                        else
                                 xmlcnt=` expr $xmlcnt + 1 `
                                 csvcnt=` expr $csvcnt + 1 `
                                 csvfile=$xmlfilename$ext
                                 xsltproc xslfile.xsl $xmlpath/$xmlfilename >> $csvpath/$csvfile
                                 #rm -f $xmlpath/$xmlfilename
                        fi
                fi
                rm -f $xmlpath/$xmlfilename
        done
        rm -rf $xmlpath

        echo "  Total $xmlcnt XML files converted to $csvcnt CSV files. CSV file location is $csvpath"
        echo "==========================================================================================="
        echo "END Process"
