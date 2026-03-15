echo "Cloning Repo...."

if [ -z "$BRANCH" ]
then
echo "Cloning main branch...."
git clone https://github.com/JishuDeveloper/Ultra-Forward-Bot
else
echo "Cloning $BRANCH branch...."
git clone -b "$BRANCH" https://github.com/JishuDeveloper/Ultra-Forward-Bot
fi

cd Ultra-Forward-Bot || exit

pip3 install -U -r requirements.txt

echo "Starting Bot...."
python3 main.py
