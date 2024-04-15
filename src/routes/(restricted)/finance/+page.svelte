<script>
	import BasePage from '$lib/UI/BasePage.svelte'
	import Tab from '$lib/UI/Tabs/Tab.svelte'
	import TabBar from '$lib/UI/Tabs/TabBar.svelte'
	import TabContainer from '$lib/UI/Tabs/TabContainer.svelte'
</script>

<BasePage title="FINANCE">
	<p>
		Here you will find information about orders, to whom they are made and what quanity of what
		products it includes, a calculation of cost and income etc.
	</p>
	<TabContainer>
		<TabBar>
			<Tab>ONE</Tab>
			<Tab>TWO</Tab>
			<Tab>THREE</Tab>
		</TabBar>
	</TabContainer>
</BasePage>
