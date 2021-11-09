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
                <td <?php if($day == "AL") echo 'bgcolor=red'; elseif($day == "WO") echo 'bgcolor=grey'; else echo ''; ?> style="color:#fff;font-weight:bold;">{!! $day !!}</td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>
