<table class="table table-striped custom-table m-b-0">
    <thead>
    <tr>
        <th rowspan="2" style="vertical-align: middle">Employee Name
        </th>
        @for($i =1; $i <= $daysInMonth; $i++)
            <th>{{ $i }}</th>
        @endfor
    </tr>
    <tr>
        @for($i =1; $i <= $daysInMonth; $i++)
            <th>
            <?php

                echo date("D",strtotime(date('Y-m-'.$i)));
            ?>
            </th>
        @endfor
        
    </tr>
    </thead>
    <tbody>
    @foreach($employeeAttendence as $key => $attendance)
        <tr>
            <td> {{ substr($key, strripos($key,'#')+strlen('#')) }} </td>
            @foreach($attendance as $day)
                <td >
                    <input type="checkbox" class="make-switch" <?php if($day == "AL") echo 'checked'; elseif($day == "WO") echo ''; else echo ''; ?> />

                </td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>
