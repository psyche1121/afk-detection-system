AFK_TIMEOUT = 20
AFK_LastAct = os.time()
AFK_Active = false
AFK_MsgSent = false

function reset_afk()
    AFK_LastAct = os.time()
    if AFK_Active then
        AFK_Active = false
        AFK_MsgSent = false
        CharacterSetScale(UserGetIndex(), 1.0)
        UnlockPlayerWalk()
        SendPlayerChat("[��ʾ] "..UserGetName().." ������.")
    end
end

function MainProcWorldKey(key)        
reset_afk() 
end

function InterfaceClickRightEvent()    
reset_afk() 
end

function MainProcInterface()
    if os.time() - AFK_LastAct >= AFK_TIMEOUT then
        if not AFK_Active then
            AFK_Active = true
            AFK_MsgSent = false
        end

        if not AFK_MsgSent then
            RenderMessage("��ʾ--"..UserGetName().." �����뿪״̬ (��������ָ�)", 1)
            SendPlayerChat("[��ʾ] "..UserGetName().." δ����״̬.")
            CharacterSetScale(UserGetIndex(), 1.3)
            LockPlayerWalk()
            AFK_MsgSent = true
        end

        local sec = os.time() - AFK_LastAct
        local min = math.floor(sec / 60)
        local rem = sec % 60
        local timeStr = string.format("[�뿪ʱ��]  %02d:%02d", min, rem)

        SetFontType(1)
        SetTextColor(255, 200, 0, 255)
        RenderText(10, 60, timeStr, 240, 1)
    end
end