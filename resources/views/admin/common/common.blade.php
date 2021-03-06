{{--COMMON Model--}}
<div id="commonModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">{{trans('core.confirmation')}}</h4>
            </div>
            <div class="modal-body" id="info">
                <p>
                    {{--Confirm Message Here from Javascript--}}
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal"
                        class="btn dark btn-outline">{{trans('core.btnCancel')}}</button>
                <button type="button" data-dismiss="modal" class="btn red" id="common"><i
                            class="fa fa-check"></i> {{trans('core.btnSend')}}</button>
            </div>
        </div>
    </div>
</div>

{{--END COMMON MODAL--}}
