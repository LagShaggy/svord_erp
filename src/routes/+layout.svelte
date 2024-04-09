<script lang="ts">
	import '$src/app.css'
	import AccountDropdown from '$lib/Account/AccountDropdown.svelte'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
	import type { LayoutData } from './$types'
	import AlertBar from '$src/lib/Alert/AlertBar.svelte'

	export let data: LayoutData
	const { session, profilePicture } = data
</script>

<AlertBar />
<HeadBar>
	<SvordxCompanyLogo />
	{#if session}
		<AccountDropdown userImage={profilePicture?.signedUrl} />
	{/if}
</HeadBar>

<slot />
