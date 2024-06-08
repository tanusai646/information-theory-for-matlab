%% 222C1021 今村優希
%% 情報理論 計算機演習2

%% 演習2-4 %% 演習2-4 BSCに100000bit通したときの相互情報量
%% pの変化を加えて，グラフにプロット
clear,clc,close all;


N = 30000;             %送信bit数


for i = 1:99            %エラー確率を変動
    p(i) = i /100;      %エラー確率の設定
    x0y0 = 0;
    x0y1 = 0;
    x1y0 = 0;
    x1y1 = 0;
% BSC通過
    for j = 1:N
        x = randi(100); % 整数の一様分布の疑似乱数の出力
        u = rand;       % 0から1の一様分布の乱数
        if(mod(x,2)==0) % 出力した乱数から0または1の送信bit作成
        % 送信bitが0の時
            if(u >= p(i))  % エラーじゃない時
                x0y0 = x0y0 + 1;
            else        % エラーの時
                x0y1 = x0y1 + 1;
            end
        else       
            % 送信bitが1のとき
            if(u >= p(i))  %エラーじゃない時
                x1y1 = x1y1 + 1;
            else        %エラーの時
                x1y0 = x1y0 + 1;
            end
        end
    end

    % 各送信受信の数の出力
    %disp(x0y0);
    %disp(x0y1);
    %disp(x1y0);
    %disp(x1y1);
    
    % 各確率の出力
    % 結合確率の計算
    Px0y0 = x0y0 / N;
    Px0y1 = x0y1 / N;
    Px1y0 = x1y0 / N;
    Px1y1 = x1y1 / N;
    % 周辺確率の計算と出力
    Px0 = Px0y0 + Px0y1;
    Px1 = Px1y0 + Px1y1;
    Py0 = Px0y0 + Px1y0;
    Py1 = Px0y1 + Px1y1;
    
    % 条件付き確率の計算と出力
    Pxy_00 = Px0y0 / Py0;
    Pxy_01 = Px0y1 / Py1;
    Pxy_10 = Px1y0 / Py0;
    Pxy_11 = Px1y1 / Py1;
    
    % 条件付きエントロピーの計算
    Hxy = - Px0y0 .* log2(Pxy_00) - Px0y1 .* log2(Pxy_01) ...
            - Px1y0 .* log2(Pxy_10) - Px1y1 .* log2(Pxy_11);
    
    % 事前エントロピーの計算
    Hx = - Px0 .* log2(Px0) - Px1 .* log2(Px1);
    
    % 相互情報量の計算
    Ixy(i) = Hx - Hxy;

    %disp(Ixy)
end

scatter(p, Ixy)

