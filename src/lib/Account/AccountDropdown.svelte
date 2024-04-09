<script lang="ts">
	import DropdownPannel from '$src/lib/UI/Dropdown/ExpandContent.svelte'
	import DropdownProvider from '$src/lib/UI/Dropdown/ExpandProvider.svelte'
	import DropdownButton from '$src/lib/UI/Dropdown/ExpandButton.svelte'
	import Link from '$lib/UI/Primitive/Link.svelte'
	import LogoutForm from '$lib/UI/Forms/LogoutForm.svelte'

	import { ROUTES } from '$lib/routes'
	import UserIcon from '../Icons/UserIcon.svelte'

	export let userImage: string = ''
</script>

<DropdownProvider let:expandControll>
	<DropdownButton expandControll={expandControll.toggle}>
		<div class="w-10 h-10 rounded-full border-1 bg-base-colour overflow-hidden">
			{#if !!userImage}
				<img src={userImage} alt="" />
			{:else}
				<UserIcon className="w-full h-full object-cover" />
			{/if}
		</div>
	</DropdownButton>
	<DropdownPannel
		expanded={expandControll}
		displaceCSS="top-10 right-10"
		className="[&>*]:(bg-comp-colour bg-opacity-10) border"
	>
		<Link on:activated={expandControll.close} path={ROUTES.PROFILE}>Profile</Link>
		<Link on:activated={expandControll.close} path={ROUTES.ORG}>Organisation</Link>
		<LogoutForm />
	</DropdownPannel>
</DropdownProvider>
