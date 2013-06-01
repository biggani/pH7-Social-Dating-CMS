<form method="post" action="{{ $design->url('newsletter','admin','browse') }}">
{{ $designSecurity->inputToken('subscriber_action') }}

<table class="center">

<thead>
<tr>
<th><input type="checkbox" name="all_action" /></th>
<th>{@lang('Subscribers ID#')@}</th>
<th>{@lang('Email Address')@}</th>
<th>{@lang('Name')@}</th>
<th>{@lang('IP')@}</th>
<th>{@lang('Registration Date')@}</th>
<th>{@lang('Action')@}</th>
</tr>
</thead>

<tfoot>
<tr>
<th><input type="checkbox" name="all_action" /></th>
<th><button type="submit" onclick="return checkChecked()" formaction="{{ $design->url('newsletter','admin','deleteall') }}" class="red">{@lang('Delete')@}</button></th>
<th> </th>
<th> </th>
<th> </th>
<th> </th>
<th> </th>
</tr>
</tfoot>

{@foreach($browse as $user)@}

<tr>
<td><input type="checkbox" name="action[]" value="{% $user->email %}" /></td>
<td>{% $user->profileId %}</td>
<td>{% $user->email %}</td>
<td>{% $user->name %}</td>
<td><img src="{{ $design->getSmallFlagIcon( Framework\Geo\Ip\Geo::getCountryCode($user->ip) ) }}" title="{@lang('IP Country')@}" alt="{@lang('IP Country')@}" /> <a href="{% Framework\Ip\Ip::api($user->ip) %}" title="{@lang('See information from this user IP')@}" target="_blank">{% $user->ip %}</a></td>
<td>{% $dateTime->get($user->joinDate)->dateTime() %}</td>
<td>{@if($user->active == 1)@}<span class="green">{@lang('Active Account')@}</span>{@else@}<span class="red">{@lang('Inactive Account')@}</span>{@/if@}</td>
</tr>

{@/foreach@}

</table>

</form>

{@main_include('page_nav.inc.tpl')@}