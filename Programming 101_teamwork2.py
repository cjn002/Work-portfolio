a=[]

file1=open('民調結果.csv', 'r', encoding='utf-8')
list_lines=file1.readlines()
file1.close()



for line in list_lines:
    a.append(line.strip().split(','))

name=' '
while name!='0':
    name=input('請輸入要查詢的名字(輸入0進入政黨支持率查詢):')
    if name!='0':
        find=0
        for i in a:
            if name in i:
                print(i[0],i[1],'歲，政黨傾向是:',i[2])
                find=1
                
        if find==0:
            print("輸入錯誤")
    else:
        print("查詢結束!")

name=' '
while name!='0':
    name=input('請輸入要查詢的政黨名稱(輸入0進入年齡層查詢):')
    if name!='0':
        A=0
        ff=0
        for line in a:
            if line[2]==name:
                A+=1
                ff=1
        print("政黨支持率:",round(A/len(a)*100) ,"%")
        if ff==0:
            print("輸入錯誤")
        
    else:
        print("查詢結束!")

name=' '
while name!='0':
    name=input('請輸入要查詢的年齡層代號(輸入0結束查詢):')
    if name!='0':
        name2=input('請輸入要查詢的政黨名稱:')
        A=0
        B=0
        n=int(name)
        for line in a:
            if 10+10*n<=int(line[1])<=19+10*n:
                B+=1
                if line[2]==name2:
                    A+=1
        print(10+10*n,"歲到",19+10*n,"的",name2,"支持率:",round(A/B*100) ,"%")
        
    else:
        print("查詢結束!")
        
