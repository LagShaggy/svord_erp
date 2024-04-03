<script lang="ts">
	import DropdownPannel from '$src/lib/UI/Dropdown/ExpandContent.svelte'
	import DropdownProvider from '$src/lib/UI/Dropdown/ExpandProvider.svelte'
	import DropdownButton from '$src/lib/UI/Dropdown/ExpandButton.svelte'
	import Link from '$lib/UI/Primitive/Link.svelte'
	import LogoutForm from '$lib/UI/Forms/LogoutForm.svelte'

	import { ROUTES } from '$lib/routes'
</script>

<DropdownProvider let:expandControll>
	<DropdownButton expandControll={expandControll.toggle}>
		<div class="w-10 h-10 rounded-full border-1 bg-base-colour overflow-hidden">
			<img src="/icons/user.svg" alt="Profile Picutre" class="w-full h-full object-cover" />
		</div>
	</DropdownButton>
	<DropdownPannel expanded={expandControll} displaceCSS="top-10 right-10">
		<Link path={ROUTES.PROFILE}>Profile</Link>
		<Link path={ROUTES.ORG}>Organisation</Link>
		<LogoutForm />
	</DropdownPannel>
</DropdownProvider>
