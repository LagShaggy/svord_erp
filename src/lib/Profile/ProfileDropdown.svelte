<script lang="ts">
	import DropdownPannel from '$src/lib/UI/Dropdown/ExpandContent.svelte'
	import DropdownProvider from '$src/lib/UI/Dropdown/ExpandProvider.svelte'
	import DropdownButton from '$src/lib/UI/Dropdown/ExpandButton.svelte'
	import Link from '$lib/UI/Primitive/Link.svelte'
	import LogoutForm from '$lib/UI/Forms/LogoutForm.svelte'

	import { ROUTES } from '$lib/routes'
	import UserIcon from '../Icons/UserIcon.svelte'
	import RoundButton from '../UI/Primitive/RoundButton.svelte'

	export let userImage: string | null = ''
</script>

<DropdownProvider let:expandControll>
	<DropdownButton expandControll={expandControll.toggle}>
		<RoundButton>
			{#if userImage}
				<img src={userImage} alt="" />
			{:else}
				<UserIcon className="w-full h-full object-cover" />
			{/if}
		</RoundButton>
	</DropdownButton>
	<DropdownPannel
		expanded={expandControll}
		displaceCSS="top-10 right-10"
		className="bg-secondary-100 bg-opacity-80 border p-2"
	>
		<Link on:activated={expandControll.close} path={ROUTES.PROFILE}>Profile</Link>
		<Link on:activated={expandControll.close} path={ROUTES.ORG}>Organisation</Link>
		<LogoutForm />
	</DropdownPannel>
</DropdownProvider>
