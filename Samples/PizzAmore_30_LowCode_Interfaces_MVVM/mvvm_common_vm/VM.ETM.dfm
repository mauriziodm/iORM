inherited VMEtm: TVMEtm
  inherited BSMaster: TioModelPresenterMaster
    TypeName = 'TEtmTimeSlot'
    LoadType = ltFromBSAsIs
  end
  inherited acShowETM: TioVMActionBSShowOrSelect
    Visible = False
  end
end
