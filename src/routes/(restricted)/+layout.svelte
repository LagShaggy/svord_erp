<script lang="ts">
	import '$src/app.css'
	import ProfileDropdown from '$src/lib/Profile/ProfileDropdown.svelte'
	import SvordxCompanyLogo from '$lib/Icons/SvordxCompanyLogo.svelte'
	import HeadBar from '$lib/UI/TopBar/HeadBar.svelte'
	import type { LayoutData } from './$types'
	import ActionButtonContainer from '$src/lib/UI/ActionButton/ActionButtonContainer.svelte'
	import NavigationBar from '$src/lib/UI/FootBar/NavigationBar.svelte'

	export let data: LayoutData
	const { session, profilePicture } = data
</script>

<HeadBar>
	<SvordxCompanyLogo />
	{#if session}
		<ProfileDropdown userImage={profilePicture} />
	{/if}
</HeadBar>
<main class="flex flex-col flex-grow w-full min-h-full bg-white">
	<div class="h-min py-6 px-5 mb-8 lg:px-8 font-oswald">
		<slot />
	</div>
</main>
<ActionButtonContainer />
<NavigationBar />
