<script>
	import { user } from '$lib/Auth/authStores'

	export let data
	let { session, message } = data
</script>

<div>
	{message}
</div>
<div>
	{session?.user.email}
	<br />
	{session?.user.aud}
</div>
