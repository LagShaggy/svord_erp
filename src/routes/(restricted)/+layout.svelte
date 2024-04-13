<script lang="ts">
	import '$src/app.css'
	import AccountDropdown from '$lib/Account/AccountDropdown.svelte'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
	import type { LayoutData } from './$types'
	import AlertBar from '$src/lib/Alert/AlertBar.svelte'
	import ActionButtonContainer from '$src/lib/UI/ActionButton/ActionButtonContainer.svelte'
	import FootBar from '$src/lib/UI/FootBar/FootBar.svelte'

	export let data: LayoutData
	const { session, profilePicture } = data
</script>

<HeadBar>
	<SvordxCompanyLogo />
	{#if session}
		<AccountDropdown userImage={profilePicture} />
	{/if}
</HeadBar>
<main class="flex flex-col flex-grow w-full min-h-full bg-slate-100">
	<div class="h-min py-6 px-5 lg:px-8 font-oswald shadow-xl">
		<slot />
	</div>
	<ActionButtonContainer />
</main>
<FootBar />
