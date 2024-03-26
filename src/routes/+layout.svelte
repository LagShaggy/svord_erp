<script lang="ts">
	import '$src/app.css'
	import AccountDropdown from '$lib/Account/AccountDropdown.svelte'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
	import { onMount } from 'svelte'
	import type { LayoutData } from './$types'

	export let data: LayoutData
	const { session } = data
</script>

<HeadBar>
	<SvordxCompanyLogo />
	{#if session}
		<AccountDropdown />
	{/if}
</HeadBar>

<slot />
