<script>
	import { user } from '$lib/Auth/authStores'
</script>

<div>
	{$user?.id}
	{$user?.email}
</div>
