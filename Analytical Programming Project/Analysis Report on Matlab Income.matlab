%reading the table, removing the columns, Pre-setup
T = readtable('adult.xls');
T(:,[1,3,5,6,7,8,9,11,12,14]) = [];
T([151:end],:)=[];
T.Var6 = randi([2000 2019],1, 150)';
T.Var7(:,1) = 1:150

%Setting Column Names Properties
T.Properties.VariableNames{1} = 'workclass';
T.Properties.VariableNames{2} = 'education';
T.Properties.VariableNames{3} = 'sex';
T.Properties.VariableNames{4} = 'hours_per_week';
T.Properties.VariableNames{5} = 'annualIncome';
T.Properties.VariableNames{6} = 'years'; %discrete uniform sample of integer
T.Properties.VariableNames{7} = 'actualIncome';

%Removing missing values from data
T(ismember(T.workclass,'?'),:)=[]

%setting the format for all columns (variables)
T.workclass = string(T.workclass);
T.education = string(T.education);
T.sex = string(T.sex);
T.hours_per_week = double(T.hours_per_week);
T.annualIncome = string(T.annualIncome);
T.years = double(T.years);
T.actualIncome = double(T.actualIncome);


%random uniform distribution for actual income for easy analysis and representation in plot/graph
for i = 1:length(T.annualIncome)
if strcmp( T.annualIncome(i), '<=50K' );
         T.actualIncome(i) = randi(39000)+10000;
     else
         T.actualIncome(i) = randi(100000)+50000;
     end
end

%Sample Condensed Data
TC = T(1:3,{'workclass','education','sex','hours_per_week','years','actualIncome'})


%Plot for total hours per week with Annual Income vs years
figure('OuterPosition',[20 20 700 800],'Color','w');
x = T.years;
y = T.actualIncome;
z = T.hours_per_week;
plot(x,y,'linestyle', 'none','color',[0 0.5 0],'marker', 'o')
xticks(2000:2:2019)
xticklabels(2000:2:2019)
yticks(0:10000:150000)
yticklabels(0:10000:100000)
ytickformat('usd')

%Another y axis for overlay
hold on
yyaxis right
plot(x,z,'linestyle','none','color','red','marker','d')
qqplot(x,z)
hold off

%Setting title, axis label, legend
title('Plot for Annual Income with Hours Worked vs Years', 'FontSize', 16);
xlabel('Years');
yyaxis left;
ylabel('Annual Income');
yyaxis right;
ylabel('Hours Worked');
ldg = legend('Annual Income', 'Hours Worked', 'Deviation', 'Normal', 'Error');
leg.NumColumns = 5;
legend('FontSize',13)
f = get(gca,'XTickLabel');
set(gca,'XTickLabel',f,'fontsize',12,'FontWeight','bold')
set(gca,'XTickLabelMode','auto')
set(gca,'linewidth',1.5)

%Pie for sex, education and workclass
%set pie for comparison with offsetting (slice) the largest component
               %those who have more than 50k and less than 50k for all of
               %them, with labels and legend

%Pie Chart for Gender vs. Annual Income
%-------------------------------------------------------

%Annual Income for Male
pMALE = (  strcmp( string(T.sex),"Male")  &  (T.actualIncome<50000)  );

%Annual Income for Female
pFEMALE = (  strcmp( string(T.sex),"Female")  &  (T.actualIncome<50000)  );

labels = {'Earned more than 50K', 'Earned less than 50K'};

% Plot 1 - Pie Chart for Male
%-------------------------------------------------------
figure('OuterPosition',[20 20 1200 1400],'Color','w');

t = tiledlayout(2,1);
ax1 = nexttile;
pf1 = pie(ax1, categorical(pMALE) );

title('Annual Income for Male', 'FontSize',24);
pText = findobj(pf1,'Type','text');

labelA = ['>50K ' pText(1).String(6:end)];
labelB = ['<50K ' pText(2).String(6:end)];

set(findobj(pf1,'type','text'),'fontsize',14)

pText(1).String = labelA;
pText(2).String = labelB;

legend(labels,'Location','northwest','FontSize',14)


% Plot 2 - Pie Chart for Female
%-------------------------------------------------------


ax2 = nexttile;
pf2 = pie(ax2, categorical(pFEMALE) , 'false');

title('Annual Income for Female', 'FontSize',24);
pText = findobj(pf2,'Type','text');

labelA = ['>50K ' pText(1).String(6:end)];
labelB = ['<=50K ' pText(2).String(6:end)];

set(findobj(pf2,'type','text'),'fontsize',14)

pText(1).String = labelA;
pText(2).String = labelB;

legend(labels,'Location','northwest', 'FontSize', 14)

% Pie Chart for Working Class vs Annual Income
%-------------------------------------------------------

idx = T.annualIncome == [">50K"];
workdata = T.workclass(idx);

idx2 = T.annualIncome == ["<=50K"];
workdata2 = T.workclass(idx2);

labels = {'Federal-gov', 'Local-gov', 'Private', 'Self-emp-inc', 'Self-not-emp-inc','State-gov'}
explode = {'Private'}

% Plot 3 - Pie Chart for Working Class with income more than 50K
%-------------------------------------------------------
figure('OuterPosition',[20 20 1200 1400],'Color','w');

t = tiledlayout(2,1);
ax1 = nexttile;
pf3 = pie(ax1, categorical(workdata), explode);
title('Workclass for Income >50K','FontSize',24)
lgd = legend('Location','northwest', 'FontSize', 14)
lgd.Title.String = 'Legend';
lgd.Title.FontSize = 12;
set(findobj(pf3,'type','text'),'fontsize',12.5)

%Plot 4  - Pie Chart for Working Class with income less than 50K
%-------------------------------------------------------
ax2 = nexttile;
explode = {'Private'}
pf4 = pie(ax2, categorical(workdata2), explode, labels);
title('Workclass for Income <= 50K', 'FontSize', 24)
lgd = legend('Location','northwest', 'FontSize', 14)
lgd.Title.String = 'Legend';
lgd.Title.FontSize = 12;
delete(findobj(pf4,'String','Federal-gov'))
delete(findobj(pf4,'String','Local-gov'))
delete(findobj(pf4,'String','State-gov'))
delete(findobj(pf4,'String','Self-emp-inc'))
delete(findobj(pf4,'String','Self-not-emp-inc'))
set(findobj(pf4,'type','text'),'fontsize',12.5)



%Pie Chart for Education vs Income
%-------------------------------------------------------
idx3 = T.annualIncome == [">50K"];
edudata = T.education(idx3);

idx4 = T.annualIncome == ["<=50K"];
edudata2 = T.education(idx4);


%Plot 5  - Pie Chart for Working Class with income less than 50K
%-------------------------------------------------------
figure('OuterPosition',[20 20 1200 1400],'Color','w');

t = tiledlayout(2,1);
ax1 = nexttile;
pf5 = pie(ax1, categorical(edudata))
title('Education for Income >50K', 'FontSize', 24)
lgd = legend('Location','northwest', 'FontSize', 14)
lgd.Title.String = 'Legend';
lgd.Title.FontSize = 12;

%Plot 4  - Pie Chart for Education with income less than 50K
%-------------------------------------------------------
ax2 = nexttile;
pf6 = pie(ax2, categorical(edudata2));
title('Education for Income <= 50K', 'FontSize', 24)
lgd = legend('Location','northwest', 'FontSize', 14)
lgd.Title.String = 'Legend';
lgd.Title.FontSize = 12;
%Histogram for Hours per Week
hpw = T.hours_per_week;
histogram(hpw)
histfit(T.hours_per_week)
title('Hours Per Week for US Census Income')

%Histogram for Hours per Week
hpw = T.hours_per_week;
histogram(hpw)
histfit(T.hours_per_week)
title('Hours Per Week for US Census Income')


%Histogram for Work-Class
wc = categorical(T.workclass);
summary(wc)
histogram(wc)
title('Work-class for US Census Income')


%Histogram for Education
ed = categorical(T.education);
summary(ed)
histogram(ed)
title('Education for US Census Income')

%Histogram for Sex
gen = categorical(T.sex);
summary(gen)
histogram(gen)
title('Education for US Census Income')

%Numerical Data representation
%statistical measure

%Numeric Representation 1 - Hours Per Week
%-------------------------------------------------------
minhpw = min(T.hours_per_week);%Minimum elements of an array
maxhpw = max(T.hours_per_week)	;%Maximum elements of an array
[Shpw, Lhpw] = bounds(T.hours_per_week)	;%Smallest and largest elements
meanhpw = mean(T.hours_per_week)	;%Average or mean value of array
medianhpw = median(T.hours_per_week);%Median value of array
modehpw = mode(T.hours_per_week)	;%Most frequent values in array
stdhpw = std(T.hours_per_week);%Standard deviation

minAI = min(T.actualIncome);%Minimum elements of an array
maxAI = max(T.actualIncome)	;%Maximum elements of an array
[SAI, LAI] = bounds(T.actualIncome)	;%Smallest and largest elements
meanAI = mean(T.actualIncome)	;%Average or mean value of array
medianAI = median(T.actualIncome);%Median value of array
modeAI = mode(T.actualIncome)	;%Most frequent values in array
stdAI = std(T.actualIncome);%Standard deviation

T_hpw = table(minhpw, maxhpw, meanhpw, medianhpw,modehpw,stdhpw);
T_ai = table(minAI, maxAI, meanAI, medianAI, modeAI, stdAI);


% Basic Data Descriptive Statistics
%-------------------------------------------------------
corrcoef(T.hours_per_week, T.actualIncome)	%Correlation coefficients
cov(T.hours_per_week, T.actualIncome)   %Covariance
