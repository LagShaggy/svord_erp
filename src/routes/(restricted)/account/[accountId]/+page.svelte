<script lang="ts">
	import CountryFlag from '$src/lib/Icons/Flags/CountryFlag.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { account } = data
	$: ({ account } = data)
</script>

<BasePage title={account ? `${account.name}` : 'No Account Name found'}>
	<div class="grid grid-cols-2">
		<h3>ID</h3>
		<p>{account?.id}</p>
		<h3>Description</h3>
		<p>{account?.description}</p>
		<h3>Website</h3>
		<p>{account?.id}</p>
		<h3>Email</h3>
		<p>{account?.email}</p>
		<h3>Country</h3>
		<p><CountryFlag countryISO={account?.country?.iso ?? ''} />{account?.country?.name}</p>
	</div>
</BasePage>
