spath="common_scripts"

export MY_COMMON_SCRIPTS="$spath"

echo "-------------------------------"
echo "Running Common TC Scripts Setup"
echo "-------------------------------"

# Check if the repository exists & if its checked out at the right directory
if [ -d ~/$spath ]; then
    echo "Correctly checked out"
else
    echo "[ E ] CVS checkout for $spath taken at the wrong path ( run '<checkout_command> $spath' )"
    exit 1
fi

# Check if the tcshrc script source command needs to be appended
temp=`grep "source \~/$spath/tcshrc/tcshrc" ~/.tcshrc`;

if [ "$temp" == "" ]; then
    echo "[ W ] tcshrc source command not found ( will be adding it )";

    #echo '# ---------------------------------------------' >> ~/.tcshrc
    #echo '# [ COMMON_SCRIPT ] Common tcshrc src   command' >> ~/.tcshrc
    #echo '# ---------------------------------------------' >> ~/.tcshrc
    echo '' >> ~/.tcshrc
    echo "source ~/$spath/tcshrc/tcshrc" >> ~/.tcshrc
    temp=`grep "source \~/$spath/tcshrc/tcshrc" ~/.tcshrc`;

    if [ "$temp" == "" ]; then
        echo "[ E ] Something went wrong in updating your .tcshrc";
        exit 1
    else
        echo "[ I ] tcshrc source command added to your .tcshrc";
    fi
else
    echo "[ I ] tcshrc is already being sourced in your .tcshrc";
fi

# Check if the vimrc script source command needs to be appended
temp=`grep "source \~/$spath/vimrc/vimrc" ~/.vimrc`;

if [ "$temp" == "" ]; then
    echo "[ W ] vimrc source command not found ( will be adding it )";

    #echo '" ---------------------------------------------' >> ~/.vimrc
    #echo '" [ COMMON_SCRIPT ] Common vimrc source command' >> ~/.vimrc
    #echo '" ---------------------------------------------' >> ~/.vimrc
    echo '' >> ~/.vimrc
    echo "source ~/$spath/vimrc/vimrc" >> ~/.vimrc
    temp=`grep "source \~/$spath/vimrc/vimrc" ~/.vimrc`;

    if [ "$temp" == "" ]; then
        echo "[ E ] Something went wrong in updating your .vimrc";
        exit 1
    else
        echo "[ I ] vimrc source command added to your vimrc";
    fi
else
    echo "[ I ] vimrc is already being sourced in your .vimrc";
fi

