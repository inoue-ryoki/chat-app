class UsersController < ApplicationController
  def edit
  end

  def update
      if current_user.update(user_params)
        redirect_to root_path
        # current_userメソッドはユーザー情報が格納されている
        # updateメソッドでuserモデルを更新
        # 保存できた場合チャット画面にリダイレクトする
        # 内容が上書きされる
      else
        render :edit;
        # 失敗した場合編集画面が表示される
        # フォームに入力した内容を保持したまま編集画面に戻る
      end






  end

 private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

# requireメソッドとはparamsが使用できるメソッド
# パラメーターからどの情報を取得するか選択する

# permitメソッドとはparamsが使用できるメソッド
# 取得したいキーを指定できる。
